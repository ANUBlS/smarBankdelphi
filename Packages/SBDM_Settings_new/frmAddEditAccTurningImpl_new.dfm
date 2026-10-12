object frmAddEditAccTurning_new: TfrmAddEditAccTurning_new
  Left = 0
  Top = 0
  ClientHeight = 192
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 111
    Top = 156
    Width = 81
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 197
    Top = 156
    Width = 81
    Height = 27
    Caption = #1048#1084#1090#1080#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 288
    Height = 149
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 5
      Top = 15
      Width = 48
      Height = 15
      Caption = #1060#1080#1083#1080#1072#1083
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
      Width = 48
      Height = 15
      Caption = #1042#1072#1083#1081#1091#1090#1072
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
      Width = 55
      Height = 15
      Caption = #1065#1077#1089#1072#1073' '#8470
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
      Height = 21
      DataField = 'BRANCHID'
      DataSource = frmAccountTurning_new.settingsDatSrc
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = frmAccountTurning_new.FilialsDatSrc
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 5
      Top = 75
      Width = 117
      Height = 21
      DataField = 'CURRENCYID'
      DataSource = frmAccountTurning_new.settingsDatSrc
      KeyField = 'VALUTE'
      ListField = 'VAL_NAME'
      ListSource = frmAccountTurning_new.ValutesDatSrc
      TabOrder = 1
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 5
      Top = 122
      Width = 272
      Height = 21
      DataField = 'ACCID'
      DataSource = frmAccountTurning_new.settingsDatSrc
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = frmAccountTurning_new.AccountsDatSrc
      TabOrder = 2
      Visible = True
    end
  end
end
