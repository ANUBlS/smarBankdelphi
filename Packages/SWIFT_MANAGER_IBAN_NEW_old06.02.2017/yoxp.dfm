object Form12: TForm12
  Left = 358
  Top = 544
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Avtorizasiya'
  ClientHeight = 61
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 144
    Top = 8
    Width = 121
    Height = 21
    Color = clAqua
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 68
    Top = 8
    Width = 73
    Height = 21
    Color = clAqua
    KeyField = 'VALU_NAME'
    ListField = 'VAL_NAME'
    ListSource = SWDataModule.ValForCommit_Dsrc
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    DataField = 'MF32A_AMOUNT'
    DataSource = SWDataModule.sw_out_2s
    TabOrder = 2
    Visible = False
  end
  object DBEdit2: TDBEdit
    Left = 136
    Top = 64
    Width = 121
    Height = 21
    DataField = 'MF32A_CURR'
    DataSource = SWDataModule.sw_out_2s
    TabOrder = 3
    Visible = False
  end
  object Button1: TButton
    Left = 40
    Top = 32
    Width = 75
    Height = 25
    Caption = 'T'#601'sdiq et'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 32
    Width = 75
    Height = 25
    Caption = #199#305'x'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 144
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 6
    Visible = False
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 88
    Width = 121
    Height = 21
    DataField = 'STATUS'
    DataSource = SWDataModule.sw_out_2s
    TabOrder = 7
    Visible = False
  end
  object DBEdit4: TDBEdit
    Left = 9
    Top = 7
    Width = 55
    Height = 21
    Color = clAqua
    DataField = 'ID'
    DataSource = SWDataModule.sw_out_2s
    TabOrder = 8
  end
end
