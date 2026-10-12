object IN_edit: TIN_edit
  Left = 329
  Top = 332
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Edit Form for IN Messages'
  ClientHeight = 111
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IN_ID: TDBEdit
    Left = 16
    Top = 45
    Width = 65
    Height = 21
    DataField = 'ID'
    DataSource = SWDataModule.sw_in1
    ReadOnly = True
    TabOrder = 0
  end
  object IN_REFERANS: TDBEdit
    Left = 88
    Top = 45
    Width = 121
    Height = 21
    DataField = 'REFERANCE'
    DataSource = SWDataModule.sw_in1
    ReadOnly = True
    TabOrder = 1
  end
  object IN_VALU: TDBEdit
    Left = 413
    Top = 45
    Width = 121
    Height = 21
    DataField = 'VALU'
    DataSource = SWDataModule.sw_in1
    ReadOnly = True
    TabOrder = 2
  end
  object IN_VALUTA: TDBEdit
    Left = 541
    Top = 45
    Width = 81
    Height = 21
    DataField = 'VALUTE'
    DataSource = SWDataModule.sw_in1
    ReadOnly = True
    TabOrder = 3
  end
  object IN_BIC: TDBEdit
    Left = 631
    Top = 45
    Width = 121
    Height = 21
    DataField = 'BIC'
    DataSource = SWDataModule.sw_in1
    ReadOnly = True
    TabOrder = 4
  end
  object IN_MT: TDBEdit
    Left = 760
    Top = 45
    Width = 89
    Height = 21
    DataField = 'MT'
    DataSource = SWDataModule.sw_in1
    ReadOnly = True
    TabOrder = 5
  end
  object IN_OK: TButton
    Left = 221
    Top = 76
    Width = 121
    Height = 25
    Caption = 'TESDIQ ET!'
    TabOrder = 6
    OnClick = IN_OKClick
  end
  object IN_CANSEL: TButton
    Left = 415
    Top = 76
    Width = 121
    Height = 25
    Caption = 'BAGLA!'
    TabOrder = 7
    OnClick = IN_CANSELClick
  end
  object acas: TSearchEdit
    Left = 216
    Top = 45
    Width = 190
    Height = 21
    TabOrder = 8
    DataSource = SWDataModule.Account_sw
    SearchField = 'ACC_NO'
  end
  object acc_n: TDBEdit
    Left = 225
    Top = 16
    Width = 135
    Height = 21
    DataField = 'ACOUNT'
    DataSource = SWDataModule.sw_in1
    TabOrder = 9
    Visible = False
  end
end
