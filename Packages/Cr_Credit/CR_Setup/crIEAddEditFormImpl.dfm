object FrmIEAddEdit: TFrmIEAddEdit
  Left = 280
  Top = 140
  BorderIcons = [biSystemMenu]
  ClientHeight = 184
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 261
    Height = 149
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 281
    object Label1: TLabel
      Left = 5
      Top = 15
      Width = 44
      Height = 15
      Caption = #212#232#235#232#224#235
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 58
      Width = 50
      Height = 15
      Caption = #194#224#235#233#243#242#224
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 104
      Width = 43
      Height = 15
      Caption = #217#229#241#224#225' '#185
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CBBranch: TDBLookupComboBox
      Left = 5
      Top = 32
      Width = 168
      Height = 22
      DataField = 'BRANCHID'
      DataSource = IETuningDataMod.DataSrcLinkValues
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = IETuningDataMod.DataSrcBranchList
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 5
      Top = 75
      Width = 117
      Height = 22
      DataField = 'CURRENCYID'
      DataSource = IETuningDataMod.DataSrcLinkValues
      KeyField = 'VALUTE'
      ListField = 'VAL_NAME'
      ListSource = IETuningDataMod.DataSrcCurrencyList
      TabOrder = 1
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 5
      Top = 122
      Width = 272
      Height = 21
      DataField = 'ACCOUNTID'
      DataSource = IETuningDataMod.DataSrcLinkValues
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = IETuningDataMod.DataSrcIEAccountList
      TabOrder = 2
      Visible = True
      OnKeyValueChanged = DBLookupComboboxEh1KeyValueChanged
    end
  end
  object Button1: TButton
    Left = 111
    Top = 156
    Width = 81
    Height = 27
    Caption = #195#255#225#243#235
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 197
    Top = 156
    Width = 81
    Height = 27
    Caption = #200#236#242#232#237#224
    TabOrder = 2
    OnClick = Button2Click
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 136
    Top = 32
  end
end
