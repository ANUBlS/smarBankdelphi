object FormLoanBalance: TFormLoanBalance
  Left = 539
  Top = 192
  ClientHeight = 115
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel
    Left = 4
    Top = 7
    Width = 89
    Height = 16
    Caption = 'Hesabat sinvolu'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 90
    Top = 38
    Width = 60
    Height = 16
    Caption = 'Qeyd kodu'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 115
    Top = 89
    Width = 81
    Height = 27
    Caption = 'Q'#601'bul'
    Default = True
    DoubleBuffered = True
    ModalResult = 1
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 209
    Top = 89
    Width = 81
    Height = 27
    Cancel = True
    Caption = #304'mtina'
    DoubleBuffered = True
    ModalResult = 2
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 100
    Top = 5
    Width = 241
    Height = 21
    EditButtons = <>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAM'
    ListSource = DataModuleConcl.DataSrcSeynbol
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object Edit1: TEdit
    Left = 176
    Top = 36
    Width = 87
    Height = 21
    TabOrder = 3
  end
end
