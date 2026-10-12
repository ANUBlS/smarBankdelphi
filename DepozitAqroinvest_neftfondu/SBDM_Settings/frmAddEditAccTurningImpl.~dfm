object frmAddEditAccTurning: TfrmAddEditAccTurning
  Left = 332
  Top = 221
  Width = 272
  Height = 205
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 264
    Height = 138
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 14
      Width = 27
      Height = 13
      Caption = 'Филиал'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 54
      Width = 43
      Height = 13
      Caption = 'Валйута'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 97
      Width = 53
      Height = 13
      Caption = 'Щесаб №'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CBBranch: TDBLookupComboBox
      Left = 5
      Top = 30
      Width = 156
      Height = 21
      DataField = 'BRANCHID'
      DataSource = frmAccountTurning.settingsDatSrc
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = frmAccountTurning.FilialsDatSrc
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 5
      Top = 70
      Width = 108
      Height = 21
      DataField = 'CURRENCYID'
      DataSource = frmAccountTurning.settingsDatSrc
      KeyField = 'VALUTE'
      ListField = 'VAL_NAME'
      ListSource = frmAccountTurning.ValutesDatSrc
      TabOrder = 1
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 5
      Top = 113
      Width = 252
      Height = 21
      DataField = 'ACCID'
      DataSource = frmAccountTurning.settingsDatSrc
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = frmAccountTurning.AccountsDatSrc
      TabOrder = 2
      Visible = True
    end
  end
  object Button1: TButton
    Left = 103
    Top = 145
    Width = 75
    Height = 25
    Caption = 'Гябул'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 183
    Top = 145
    Width = 75
    Height = 25
    Caption = 'Имтина'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 176
    Top = 32
  end
end
