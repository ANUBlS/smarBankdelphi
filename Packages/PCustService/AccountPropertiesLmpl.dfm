object AccountProperties: TAccountProperties
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Hesab'#305'n a'#231#305'lmas'#305
  ClientHeight = 351
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 316
    Align = alClient
    BevelKind = bkFlat
    TabOrder = 0
    object Label2: TLabel
      Left = 15
      Top = 38
      Width = 84
      Height = 13
      Caption = 'Hesab'#305'n valyutas'#305
    end
    object Label3: TLabel
      Left = 15
      Top = 67
      Width = 65
      Height = 13
      Caption = 'Balans hesab'#305
    end
    object Label4: TLabel
      Left = 15
      Top = 97
      Width = 77
      Height = 13
      Caption = 'Hesab'#305'n t'#601'yinat'#305
    end
    object Label5: TLabel
      Left = 15
      Top = 216
      Width = 66
      Height = 13
      Caption = 'M'#252#351't'#601'rinin ad'#305
    end
    object Label6: TLabel
      Left = 15
      Top = 246
      Width = 22
      Height = 13
      Caption = 'Filial'#305
    end
    object Label7: TLabel
      Left = 15
      Top = 158
      Width = 76
      Height = 13
      Caption = 'Hesab'#305'n simvolu'
    end
    object Label_Symbols: TLabel
      Left = 115
      Top = 156
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 15
      Top = 188
      Width = 55
      Height = 13
      Caption = 'Hesab'#305'n ad'#305
    end
    object Label9: TLabel
      Left = 102
      Top = 36
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
    object Label11: TLabel
      Left = 102
      Top = 65
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
    object Label12: TLabel
      Left = 102
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
    object Acc_nuber: TSpeedButton
      Left = 150
      Top = 274
      Width = 20
      Height = 21
      OnClick = Acc_nuberClick
    end
    object Label15: TLabel
      Left = 176
      Top = 275
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
    object Label13: TLabel
      Left = 15
      Top = 277
      Width = 52
      Height = 13
      Caption = 'Avtohesab'
    end
    object Label16: TLabel
      Left = 15
      Top = 126
      Width = 86
      Height = 13
      Caption = 'Hesabatin simvolu'
    end
    object Label1: TLabel
      Left = 15
      Top = 10
      Width = 55
      Height = 13
      Caption = 'Hesab'#305'n tipi'
    end
    object Label10: TLabel
      Left = 102
      Top = 8
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
    object DBEdit1: TDBEdit
      Left = 186
      Top = 243
      Width = 275
      Height = 21
      DataField = 'NAME'
      DataSource = DataModPCustService.Dsrc_CurrentUserFilial
      TabOrder = 8
    end
    object DBLookupComboboxEh3: TDBLookupComboboxEh
      Left = 186
      Top = 64
      Width = 275
      Height = 21
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = DataModPCustService.Dsrc_bal_spr
      TabOrder = 5
      Visible = True
      OnChange = DBLookupComboboxEh3Change
    end
    object Edit3: TEdit
      Left = 115
      Top = 35
      Width = 70
      Height = 21
      TabOrder = 2
      OnExit = Edit3Exit
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 116
      Top = 64
      Width = 70
      Height = 21
      TabOrder = 4
      OnExit = Edit4Exit
      OnKeyPress = Edit4KeyPress
    end
    object Edit5: TEdit
      Left = 115
      Top = 94
      Width = 70
      Height = 21
      TabOrder = 0
      OnExit = Edit5Exit
      OnKeyPress = Edit5KeyPress
    end
    object DBLookupComboboxEh2: TDBLookupComboboxEh
      Left = 186
      Top = 35
      Width = 275
      Height = 21
      EditButtons = <>
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = DataModPCustService.DsrcValute_acc
      TabOrder = 3
      Visible = True
      OnChange = DBLookupComboboxEh2Change
      OnCloseUp = DBLookupComboboxEh2CloseUp
    end
    object DBLookupComboboxEh4: TDBLookupComboboxEh
      Left = 186
      Top = 94
      Width = 275
      Height = 21
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'SYMBOL'
      ListField = 'NAME'
      ListSource = DataModPCustService.Dsrc_account_symbols1
      TabOrder = 1
      Visible = True
      OnChange = DBLookupComboboxEh4Change
    end
    object DBEdit2: TDBEdit
      Left = 115
      Top = 213
      Width = 70
      Height = 21
      DataField = 'ID'
      DataSource = DataModPCustService.DS_CUSTOMERS_PHYS_FS
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit3: TDBEdit
      Left = 186
      Top = 213
      Width = 275
      Height = 21
      DataField = 'CUST_NAME'
      DataSource = DataModPCustService.DS_CUSTOMERS_PHYS_FS
      ReadOnly = True
      TabOrder = 10
    end
    object Edit_AccName: TEdit
      Left = 115
      Top = 185
      Width = 346
      Height = 21
      TabOrder = 7
    end
    object Button1: TButton
      Left = 346
      Top = 153
      Width = 112
      Height = 25
      Caption = 'Simvollar ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
    object EditAccNo: TEdit
      Left = 184
      Top = 274
      Width = 277
      Height = 21
      TabOrder = 11
    end
    object DBLookupComboboxEh5: TDBLookupComboboxEh
      Left = 186
      Top = 7
      Width = 275
      Height = 21
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModPCustService.Dsrc_acc_types
      TabOrder = 12
      Visible = True
      OnChange = DBLookupComboboxEh5Change
      OnCloseUp = DBLookupComboboxEh5CloseUp
    end
    object DBLookupComboboxEh6: TDBLookupComboboxEh
      Left = 186
      Top = 123
      Width = 275
      Height = 21
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModPCustService.Dsrc_ReportSymbol
      TabOrder = 13
      Visible = True
      OnChange = DBLookupComboboxEh6Change
    end
    object Edit1: TEdit
      Left = 115
      Top = 7
      Width = 70
      Height = 21
      TabOrder = 14
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object Edit6: TEdit
      Left = 115
      Top = 123
      Width = 70
      Height = 21
      TabOrder = 15
      OnExit = Edit6Exit
      OnKeyPress = Edit6KeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 316
    Width = 473
    Height = 35
    Align = alBottom
    BevelKind = bkTile
    TabOrder = 1
    object XFBitBtn1: TXFBitBtn
      Left = 154
      Top = 4
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
      Top = 4
      Width = 75
      Height = 25
      Caption = #304'mtina'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = XFBitBtn2Click
    end
  end
end
