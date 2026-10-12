object frmOtherOperations: TfrmOtherOperations
  Left = 468
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'frmOtherOperations'
  ClientHeight = 129
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 124
    Top = 2
    Width = 76
    Height = 14
    Caption = #1070#1076#1103#1085#1080#1096' '#1085#1102#1074#1094':'
  end
  object Label2: TLabel
    Left = 3
    Top = 44
    Width = 41
    Height = 14
    Caption = #1052#1103#1073#1083#1103#1100':'
  end
  object Label4: TLabel
    Left = 6
    Top = 3
    Width = 30
    Height = 14
    Caption = #1058#1072#1088#1080#1093
  end
  object Label3: TLabel
    Left = 127
    Top = 44
    Width = 53
    Height = 14
    Caption = #1058#1103#1081#1080#1085#1072#1090#1099':'
  end
  object ComboBox1: TComboBox
    Left = 123
    Top = 20
    Width = 182
    Height = 22
    Style = csDropDownList
    TabOrder = 1
    OnChange = ComboBox1Change
    Items.Strings = (
      'AZERCELL'
      'BAKCELL'
      'GAS'
      'LIGHT'
      'NAR'
      'WATER'
      'SUMLIGHT')
  end
  object DBEditEh1: TDBEditEh
    Left = 3
    Top = 61
    Width = 114
    Height = 22
    DataField = 'AMOUNT'
    DataSource = dmpbf_transaction.PBFOperationsds
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 93
    Width = 80
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 174
    Top = 93
    Width = 81
    Height = 27
    Caption = #1048#1084#1090#1080#1085#1072
    DoubleBuffered = True
    ModalResult = 2
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 4
    Top = 20
    Width = 114
    Height = 21
    Date = 40139.516187789400000000
    Time = 40139.516187789400000000
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 124
    Top = 61
    Width = 183
    Height = 22
    DataField = 'NAME'
    DataSource = dmpbf_transaction.PBFOperationsds
    TabOrder = 3
  end
end
