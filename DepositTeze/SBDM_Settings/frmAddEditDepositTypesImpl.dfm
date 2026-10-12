object frmAddEditDepositTypes: TfrmAddEditDepositTypes
  Left = 349
  Top = 202
  BorderIcons = [biSystemMenu]
  ClientHeight = 134
  ClientWidth = 312
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 5
    Top = 14
    Width = 22
    Height = 14
    Caption = #1040#1076#1099
  end
  object Label2: TLabel
    Left = 5
    Top = 46
    Width = 28
    Height = 14
    Caption = #1053#1102#1074#1094
  end
  object Label3: TLabel
    Left = 5
    Top = 78
    Width = 24
    Height = 14
    Caption = #1058#1080#1087#1080
  end
  object ButtonOk: TButton
    Left = 129
    Top = 103
    Width = 81
    Height = 27
    Caption = '&'#1043#1103#1073#1091#1083
    TabOrder = 0
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 218
    Top = 103
    Width = 80
    Height = 27
    Caption = '&'#1048#1084#1090#1080#1085#1072
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object DBEditEh1: TDBEditEh
    Left = 54
    Top = 11
    Width = 251
    Height = 22
    DataField = 'TYPE'
    DataSource = frmDepositTypes.DepositTypesDatSrc
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 54
    Top = 42
    Width = 251
    Height = 22
    DataField = 'ADDITIONALTYPE'
    DataSource = frmDepositTypes.DepositTypesDatSrc
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ADDTYPENAME'
    ListField = 'ADDTYPEDESC'
    ListSource = frmDepositTypes.AddTypesForcollDatSrc
    TabOrder = 3
    Visible = True
  end
  object DBLookupComboboxEh2: TDBLookupComboboxEh
    Left = 54
    Top = 72
    Width = 251
    Height = 22
    DataField = 'WITHDRAWTYPE'
    DataSource = frmDepositTypes.DepositTypesDatSrc
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'WITHDRTYPE'
    ListField = 'WITHDRTYPEDESC'
    ListSource = frmDepositTypes.AddTypesForWithDatSrc
    TabOrder = 4
    Visible = True
  end
end
