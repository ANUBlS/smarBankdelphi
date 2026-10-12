object Payreport: TPayreport
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'PaymetsReport'
  ClientHeight = 126
  ClientWidth = 186
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePicker1: TDateTimePicker
    Left = 0
    Top = 0
    Width = 186
    Height = 21
    Date = 44219.403385393520000000
    Time = 44219.403385393520000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 0
    Top = 25
    Width = 186
    Height = 21
    Date = 44219.403385393520000000
    Time = 44219.403385393520000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 48
    Top = 101
    Width = 75
    Height = 25
    Caption = #199'ap'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 48
    Top = 8
    Width = 75
    Height = 25
    Caption = #199'ap portfel'
    ImageIndex = 29
    TabOrder = 3
    Visible = False
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 0
    Top = 74
    Width = 186
    Height = 21
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 7
    Top = 52
    Width = 97
    Height = 17
    Caption = 'M'#252#351't'#601'ri '#252'zr'#601
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object DBLookupCombobox1: TDBLookupComboboxEh
    Left = 0
    Top = 75
    Width = 186
    Height = 21
    Enabled = False
    EditButtons = <>
    KeyField = 'PRTID'
    ListField = 'BORROWER_NAME'
    TabOrder = 6
    Visible = True
    OnChange = DBLookupCombobox1Change
  end
  object Button4: TButton
    Left = 96
    Top = 44
    Width = 75
    Height = 25
    Caption = 'hwquqi'
    TabOrder = 7
    Visible = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 111
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Emlak'
    TabOrder = 8
    Visible = False
    OnClick = Button5Click
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 136
  end
end
