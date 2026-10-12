object frmBalAccs: TfrmBalAccs
  Left = 286
  Top = 189
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Balans Hesablari'
  ClientHeight = 321
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Evanescence1: TEvanescence
    Left = 0
    Top = 32
    Width = 249
    Height = 257
    ItemHeight = 13
    TabOrder = 0
    DataSource = AdministrationData.BalAcc
    ListField = 'bal_acc'
    KeyField = 'bal_acc'
  end
  object Button1: TButton
    Left = 173
    Top = 294
    Width = 75
    Height = 25
    Caption = 'ֱאüכא'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 85
    Top = 294
    Width = 75
    Height = 25
    Caption = 'ֹאההארא יאח'
    TabOrder = 2
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 296
    Width = 17
    Height = 17
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 0
    Top = 4
    Width = 249
    Height = 21
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = AdministrationData.opTypes
    TabOrder = 4
    OnClick = DBLookupComboBox1Click
  end
end
