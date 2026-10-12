object Form_cust: TForm_cust
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 111
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 35
    Height = 13
    Caption = 'Pinkod:'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 41
    Height = 13
    Caption = 'Tel mob:'
  end
  object DBEdit1: TDBEdit
    Left = 104
    Top = 8
    Width = 245
    Height = 21
    DataField = 'PASSPIN'
    DataSource = TrancheDataModule.dsrc_cust
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 104
    Top = 45
    Width = 245
    Height = 21
    DataField = 'PHONE_M'
    DataSource = TrancheDataModule.dsrc_cust
    TabOrder = 1
  end
  object Button1: TButton
    Left = 274
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button1Click
  end
end
