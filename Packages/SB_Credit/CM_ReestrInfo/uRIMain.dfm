object frmRIMain: TfrmRIMain
  Left = 345
  Top = 230
  BorderIcons = [biSystemMenu]
  ClientHeight = 337
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    480
    337)
  PixelsPerInch = 96
  TextHeight = 14
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 9
    Top = 17
    Width = 463
    Height = 22
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
    Left = 9
    Top = 52
    Width = 463
    Height = 276
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 14
    TabOrder = 1
    DataSource = RIDataMod.Credits
    ListField = 'NAME'
    KeyField = 'ID'
  end
  object Button1: TButton
    Left = 322
    Top = 336
    Width = 81
    Height = 27
    Anchors = [akRight, akBottom]
    Caption = #1063#1072#1087
    TabOrder = 2
    OnClick = Button1Click
    ExplicitLeft = 349
  end
  object Button2: TButton
    Left = 425
    Top = 335
    Width = 81
    Height = 27
    Anchors = [akRight, akBottom]
    Caption = #1041#1072#1100#1083#1072
    TabOrder = 3
    OnClick = Button2Click
    ExplicitLeft = 452
  end
end
