object frmAddEditTr: TfrmAddEditTr
  Left = 209
  Top = 231
  BorderIcons = [biSystemMenu]
  Caption = 'frmAddEditTr'
  ClientHeight = 161
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 2
    Top = 37
    Width = 92
    Height = 14
    Caption = #1052#1094#1096#1090#1103#1088#1080' '#1097#1077#1089#1072#1073#1099':'
  end
  object Label2: TLabel
    Left = 163
    Top = 14
    Width = 41
    Height = 14
    Caption = #1052#1103#1073#1083#1103#1100':'
  end
  object Label3: TLabel
    Left = 2
    Top = 76
    Width = 53
    Height = 14
    Caption = #1058#1103#1081#1080#1085#1072#1090#1099':'
  end
  object Label28: TLabel
    Left = 169
    Top = 37
    Width = 25
    Height = 14
    Caption = #1040#1076#1099':'
  end
  object Label4: TLabel
    Left = 1
    Top = 14
    Width = 30
    Height = 14
    Caption = #1058#1072#1088#1080#1093
  end
  object CMSearchEdit1: TCMSearchEdit
    Tag = 3
    Left = 2
    Top = 53
    Width = 156
    Height = 22
    TabOrder = 2
    OnKeyPress = DBEditEh1KeyPress
    DataField = 'CLIENTACCID'
    DataSource = dmpbf_transaction.PBFOperationsds
    KeyField = 'ID'
    ListField = 'ACC_NO'
    ListSource = dmpbf_transaction.PBFAccsds
    ErrorColor = clRed
    BeepOnNotFound = True
  end
  object DBLookupComboboxEh9: TDBLookupComboboxEh
    Tag = 3
    Left = 165
    Top = 53
    Width = 156
    Height = 22
    DataField = 'CLIENTACCID'
    DataSource = dmpbf_transaction.PBFOperationsds
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dmpbf_transaction.PBFAccsds
    TabOrder = 3
    Visible = True
    OnKeyPress = DBEditEh1KeyPress
  end
  object DBEditEh1: TDBEditEh
    Left = 206
    Top = 11
    Width = 114
    Height = 22
    DataField = 'AMOUNT'
    DataSource = dmpbf_transaction.PBFOperationsds
    EditButtons = <>
    TabOrder = 1
    Visible = True
    OnKeyPress = DBEditEh1KeyPress
  end
  object DBEditEh2: TDBEditEh
    Left = 2
    Top = 95
    Width = 319
    Height = 22
    DataField = 'NAME'
    DataSource = dmpbf_transaction.PBFOperationsds
    EditButtons = <>
    TabOrder = 4
    Visible = True
    OnKeyPress = DBEditEh1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 65
    Top = 126
    Width = 80
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 172
    Top = 126
    Width = 81
    Height = 27
    Caption = #1048#1084#1090#1080#1085#1072
    DoubleBuffered = True
    ModalResult = 2
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 32
    Top = 11
    Width = 114
    Height = 21
    Date = 40139.516187789400000000
    Time = 40139.516187789400000000
    TabOrder = 0
  end
end
