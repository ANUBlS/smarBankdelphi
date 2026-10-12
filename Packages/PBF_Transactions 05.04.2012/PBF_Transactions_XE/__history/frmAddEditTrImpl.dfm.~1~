object frmAddEditTr: TfrmAddEditTr
  Left = 209
  Top = 231
  Width = 315
  Height = 171
  BorderIcons = [biSystemMenu]
  Caption = 'frmAddEditTr'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 34
    Width = 71
    Height = 13
    Caption = 'ћцшт€ри щесабы:'
  end
  object Label2: TLabel
    Left = 151
    Top = 13
    Width = 38
    Height = 13
    Caption = 'ћ€бл€ь:'
  end
  object Label3: TLabel
    Left = 2
    Top = 71
    Width = 40
    Height = 13
    Caption = '“€йинаты:'
  end
  object Label28: TLabel
    Left = 157
    Top = 34
    Width = 18
    Height = 13
    Caption = 'јды:'
  end
  object Label4: TLabel
    Left = 1
    Top = 13
    Width = 23
    Height = 13
    Caption = '“арих'
  end
  object CMSearchEdit1: TCMSearchEdit
    Tag = 3
    Left = 2
    Top = 49
    Width = 145
    Height = 21
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
    Left = 153
    Top = 49
    Width = 145
    Height = 21
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
    Left = 191
    Top = 10
    Width = 106
    Height = 21
    DataField = 'AMOUNT'
    DataSource = dmpbf_transaction.PBFOperationsds
    EditButtons = <>
    TabOrder = 1
    Visible = True
    OnKeyPress = DBEditEh1KeyPress
  end
  object DBEditEh2: TDBEditEh
    Left = 2
    Top = 88
    Width = 296
    Height = 21
    DataField = 'NAME'
    DataSource = dmpbf_transaction.PBFOperationsds
    EditButtons = <>
    TabOrder = 4
    Visible = True
    OnKeyPress = DBEditEh1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 60
    Top = 117
    Width = 75
    Height = 25
    Caption = '√€бул'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 117
    Width = 75
    Height = 25
    Caption = '»мтина'
    ModalResult = 2
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 30
    Top = 10
    Width = 106
    Height = 21
    CalAlignment = dtaLeft
    Date = 40139.5161877894
    Time = 40139.5161877894
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
end
