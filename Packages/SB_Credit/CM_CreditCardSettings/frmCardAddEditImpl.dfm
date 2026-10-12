object frmCardAddEdit: TfrmCardAddEdit
  Left = 278
  Top = 223
  BorderIcons = [biSystemMenu]
  ClientHeight = 131
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 6
    Width = 18
    Height = 15
    Caption = 'Ad'#305
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 49
    Width = 67
    Height = 15
    Caption = 'Ad'#305'(English)'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 4
    Top = 78
    Width = 56
    Height = 15
    Caption = 'Hesab.tipi'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEditEh1: TDBEditEh
    Left = 87
    Top = 5
    Width = 233
    Height = 21
    DataField = 'DESCRIPTION'
    DataSource = DMCardSeting.cardsortsDatSrc
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 87
    Top = 40
    Width = 233
    Height = 21
    DataField = 'NAME'
    DataSource = DMCardSeting.cardsortsDatSrc
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 102
    Width = 81
    Height = 27
    Caption = 'Q'#601'bul'
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 238
    Top = 102
    Width = 81
    Height = 27
    Caption = #304'mtina'
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object HBCards: TCMHintBox
    Left = 3
    Top = 107
    Width = 135
    Height = 22
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'HBCards'
    TabOrder = 4
    Visible = False
    Timeout = 4000
    BeepOnMessage = False
  end
  object LCBCALCMethod: TDBLookupComboboxEh
    Left = 87
    Top = 70
    Width = 233
    Height = 21
    DataField = 'CALCMETHOD'
    DataSource = DMCardSeting.cardsortsDatSrc
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'DESCRIPTION'
    ListSource = DMCardSeting.cardmethodsDatSrc
    TabOrder = 5
    Visible = True
  end
end
