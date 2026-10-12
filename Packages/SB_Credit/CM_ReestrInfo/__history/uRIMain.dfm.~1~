object frmRIMain: TfrmRIMain
  Left = 345
  Top = 230
  Width = 515
  Height = 371
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 8
    Top = 16
    Width = 490
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'DESCRIPTION'
    ListSource = RIDataMod.Banks
    TabOrder = 0
    Visible = True
    OnChange = DBLookupComboboxEh1Change
  end
  object chkCredits: TEvanescence
    Left = 8
    Top = 48
    Width = 490
    Height = 257
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
    DataSource = RIDataMod.Credits
    ListField = 'NAME'
    KeyField = 'ID'
  end
  object Button1: TButton
    Left = 324
    Top = 312
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Чап'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 420
    Top = 311
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Баьла'
    TabOrder = 3
    OnClick = Button2Click
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Реестр щесабаты'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 16
    Top = 304
  end
end
